/* eslint-disable prefer-const */
/* eslint-disable @typescript-eslint/no-explicit-any */
import { CommonModule } from '@angular/common';
import { Component, Inject, OnInit, ViewContainerRef } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { MomentDateAdapter } from '@angular/material-moment-adapter';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE, MatOptionModule } from '@angular/material/core';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MAT_DIALOG_DATA, MatDialog, MatDialogActions, MatDialogClose, MatDialogContent, MatDialogRef, MatDialogTitle } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatFormField, MatInput, MatLabel } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatSlideToggle, MatSlideToggleChange } from '@angular/material/slide-toggle';
import { MatTooltipModule } from '@angular/material/tooltip';
import { Interview_CandidateStatus, Interview_CompanyStatus, Interview_Type } from '../../../shared/enums/EInterview.model';
import { InterviewService } from '../../../data/interview/interview.service';
import { RecruiterService } from '../../../data/recruiter/recruiter.service';
import { AuthService } from '../../../core/services/auth.service';
import { Recruiter } from '../../../data/recruiter/recruiter.model';
import { Interview } from '../../../data/interview/interview.model';
import { RouterModule } from '@angular/router';
import { Subject, debounceTime, forkJoin, startWith } from 'rxjs';
import { CustomDateTimeService } from '../../../shared/service/custom-datetime.service';
import { ExpandbuttonComponent } from "../../../shared/component/expandbutton/expandbutton.component";
import { AddFormComponent } from './add-form/add-form.component';
import { SendMultiEmailComponent } from './send-multi-email/send-multi-email.component';
import { PositionService } from '../../../data/position/position.service';
import { MatMenuModule } from '@angular/material/menu';
import { MY_DAY_FORMATS } from '../../../core/constants/app.env';
import { ToastrService } from 'ngx-toastr';
import { AutocompleteComponent } from '../../../shared/component/inputs/autocomplete/autocomplete.component';
import { CookieService } from 'ngx-cookie-service';
import { GGMeetService } from '../../../shared/service/ggmeet.service';
import { MatExpansionModule } from '@angular/material/expansion';
@Component({
	selector: 'app-interview',
	standalone: true,
	providers: [
		{ provide: DateAdapter, useClass: MomentDateAdapter, deps: [MAT_DATE_LOCALE] },
		{ provide: MAT_DATE_FORMATS, useValue: MY_DAY_FORMATS },
	],
	templateUrl: './interview.component.html',
	styleUrl: './interview.component.css',
	imports: [
		MatExpansionModule,
		AutocompleteComponent,
		MatMenuModule,
		RouterModule,
		MatDatepickerModule,
		MatSlideToggle,
		MatCheckboxModule,
		MatSelectModule,
		MatInput,
		MatOptionModule,
		MatLabel,
		MatFormField,
		ReactiveFormsModule,
		MatTooltipModule,
		MatButtonModule,
		MatIconModule,
		CommonModule,
		ExpandbuttonComponent
	]
})
export class InterviewComponent implements OnInit {

	constructor(
		private dialog: MatDialog,
		private viewContainerRef: ViewContainerRef,
		private formBuilder: FormBuilder,
		private interviewService: InterviewService,
		private recruiterService: RecruiterService,
		private cookieService: CookieService,
		// private applicationService: ApplicationService,
		// private interviewerService: InterviewerService,
		private customDateService: CustomDateTimeService,
		private toastr: ToastrService,
		private positionService: PositionService,
		private authService: AuthService,
		private ggmeetService: GGMeetService,
	) { }

	private filterSubject = new Subject<any>();
	public recruiter?: Recruiter;
	public interview_CompanyStatus: typeof Interview_CompanyStatus = Interview_CompanyStatus;
	public interview_Type: typeof Interview_Type = Interview_Type;
	public interview_CandidateStatus: typeof Interview_CandidateStatus = Interview_CandidateStatus;
	public fetchedInterviews?: Interview[];
	public positionData$ = this.positionService.getAllPositions(undefined, undefined, undefined, undefined, this.authService.getRecruiterId_OfUser())

	public listUpdateInterview: any[] = [];

	public login() {
		this.ggmeetService.loginWithPopup('/interviews');
	}

	public log() {
		console.log('this.ggmeetService.accessTokenExpiration', this.ggmeetService.accessTokenExpiration);
	}

	checked(companyStatus: any) {
		return companyStatus === this.interview_CompanyStatus.PASSED || companyStatus === this.interview_CompanyStatus.PASSED_N_MAILED
	}

	updateListInterviewStatus() {
		console.log('', this.listUpdateInterview)
		const request = this.listUpdateInterview.map(e =>
			this.interviewService.updateStatusInterview(e.interviewId, e.Company_Status, e.Candidate_Status)
		)

		forkJoin(request).subscribe({
			next: (responses) => {
				console.log('All updates completed:', responses);
				// window.location.reload();
				const formValue = this.filterForm.value;
				formValue.fromDate = this.customDateService.sameValueToUTC(formValue.fromDate, true);
				formValue.toDate = this.customDateService.sameValueToUTC(formValue.toDate, true);
				this.fetchInterviews(this.recruiter?.companyId, formValue, formValue.sortString);
			},
			error: (err) => {
				console.error('Error occurred during updates:', err);
				// Handle error appropriately
			}
		});
	}

	onToggleChange(event: MatSlideToggleChange, interview: Interview) {
		console.log('Toggle changed:', event.checked);
		console.log('interview:', interview);
		if (this.listUpdateInterview.filter(e => e.interviewId === interview.interviewId).length == 1) {
			this.listUpdateInterview = this.listUpdateInterview.filter(e => e.interviewId !== interview.interviewId)
			return;
		}
		if (event.checked) {
			if (interview.company_Status !== this.interview_CompanyStatus.PASSED) {
				this.listUpdateInterview.push({
					interviewId: interview.interviewId,
					Candidate_Status: this.interview_CandidateStatus.FINISHED,
					Company_Status: this.interview_CompanyStatus.PASSED,
				})
			}
		}
		else {
			if (interview.company_Status === this.interview_CompanyStatus.PASSED) {
				this.listUpdateInterview.push({
					interviewId: interview.interviewId,
					Candidate_Status: this.interview_CandidateStatus.NOT_START,
					Company_Status: this.interview_CompanyStatus.FINISHED,
				})
			}
		}

	}

	public openEditFormDialog(interview: Interview, enterAnimationDuration: string,
		exitAnimationDuration: string) {
		const addFormDialog = this.dialog.open(AddFormComponent, {
			viewContainerRef: this.viewContainerRef,
			data: {
				recruiter: this.recruiter,
				interview: interview,
			},
			width: '1000px',
			height: '500px',
			enterAnimationDuration,
			exitAnimationDuration,
		});

		addFormDialog.afterClosed().subscribe(() => {
			let formValue = this.filterForm.value;
			formValue.fromDate = this.customDateService.sameValueToUTC(formValue.fromDate, true);
			formValue.toDate = this.customDateService.sameValueToUTC(formValue.toDate, true);
			this.fetchInterviews(this.recruiter?.companyId, formValue, formValue.sortString);
		});
	}

	public openConfirmDialog(interviewId?: string, oldCompanyStatus?: number,
		enterAnimationDuration?: string, exitAnimationDuration?: string) {
		const addFormDialog = this.dialog.open(ConfirmDialog, {
			viewContainerRef: this.viewContainerRef,
			data: {
				interviewId: interviewId,
				oldCompanyStatus: oldCompanyStatus,
			},
			width: '400px',
			height: '250px',
			enterAnimationDuration,
			exitAnimationDuration,
		});

		addFormDialog.afterClosed().subscribe(() => {
			let formValue = this.filterForm.value;
			formValue.fromDate = this.customDateService.sameValueToUTC(formValue.fromDate, true);
			formValue.toDate = this.customDateService.sameValueToUTC(formValue.toDate, true);
			this.fetchInterviews(this.recruiter?.companyId, formValue, formValue.sortString);
		});
	}

	public openAddFormDialog(enterAnimationDuration: string,
		exitAnimationDuration: string) {
		// const positionsData$ = this.positionService.getAllPositions(undefined, undefined, undefined, undefined, this.recruiter?.recruiterId)
		// const applicationsData$ = this.applicationService.getAll();
		// const interviewersData$ = this.interviewerService.getAll();

		// positionsData$.subscribe((data) => {
		const addFormDialog = this.dialog.open(AddFormComponent, {
			viewContainerRef: this.viewContainerRef,
			data: {
				recruiter: this.recruiter,
				// interviewersData: interviewersData,
			},
			width: '1000px',
			height: '500px',
			enterAnimationDuration,
			exitAnimationDuration,
		});

		addFormDialog.afterClosed().subscribe(() => {
			let formValue = this.filterForm.value;
			formValue.fromDate = this.customDateService.sameValueToUTC(formValue.fromDate, true);
			formValue.toDate = this.customDateService.sameValueToUTC(formValue.toDate, true);
			this.fetchInterviews(this.recruiter?.companyId, formValue, formValue.sortString);
		});
		// })

		// forkJoin([applicationsData$, interviewersData$]).subscribe(([applicationsData, interviewersData]) => {
		// 	this.dialog.open(AddFormComponent, {
		// 		viewContainerRef: this.viewContainerRef,
		// 		data: {
		// 			applicationsData: applicationsData,
		// 			interviewersData: interviewersData,
		// 		},
		// 		width: '800px',
		// 		height: '500px',
		// 		enterAnimationDuration,
		// 		exitAnimationDuration,
		// 	});
		// });

	}

	public openSendMultiEmailDialog(enterAnimationDuration: string,
		exitAnimationDuration: string) {
		this.dialog.open(SendMultiEmailComponent, {
			viewContainerRef: this.viewContainerRef,
			data: {
				emails: this.fetchedInterviews?.map(e => ({
					email: e.application?.cv?.candidate?.user?.email,
					company_Status: e.company_Status
				})),
			},
			width: '500px',
			height: '300px',
			enterAnimationDuration,
			exitAnimationDuration,
		});
	}

	public openEmail(email?: string) {
		if (email) {
			window.open("https://mail.google.com/mail/?view=cm&fs=1&to=" + email, "_blank");
		}

	}

	public filterForm: FormGroup = this.formBuilder.group({
		search: ['', []],
		sortString: ['MeetingDate_DESC', []],
		onlyMine: [false, []],
		// candidateStatus: ['', []],
		interviewType: [null, []],
		companyStatus: ['', []],
		fromTime: ['', []],
		toTime: ['', []],
		fromDate: [null, []],
		toDate: [null, []],
		positionId: ['', []],
	});

	private fetchInterviews(companyId?: string, interviewFilterModel?: any, sortString?: string) {
		if (companyId) {
			// console.log('companyId', companyId)
			// console.log('interviewFilterModel', interviewFilterModel)
			// console.log('sortString', sortString)
			this.interviewService.getInterviewsByCompanyId(companyId, interviewFilterModel, sortString)
				.subscribe((data) => {
					this.fetchedInterviews = data
					if (interviewFilterModel) {
						if (interviewFilterModel.onlyMines) {
							this.fetchedInterviews = data.filter(e => e.recruiterId === this.recruiter?.recruiterId);
						}
					}

					// console.log('this.fetchedInterviews', this.fetchedInterviews)
				});
		}
	}

	public refreshOAuthService() {

	}

	ngOnInit(): void {
		const currentUserId = this.authService.getLocalCurrentUser().id;
		if (currentUserId) {
			this.recruiterService.getRecruiterByUserId(currentUserId)
				.subscribe((recruiter) => {
					this.recruiter = recruiter;
					// console.log('recruiter', recruiter)
					this.fetchInterviews(recruiter.companyId);
				})
		}

		this.filterForm.valueChanges
			.pipe(startWith(null))
			.subscribe(() => {
				const formValue = this.filterForm.value;
				if (((formValue.fromTime !== null) === (formValue.toTime !== null)
					&& ((formValue.fromDate !== null) === (formValue.toDate !== null)))
				) {
					this.filterSubject.next(formValue);
				}
			})

		this.filterSubject.pipe(debounceTime(300)).subscribe((formValue) => {
			formValue.fromDate = this.customDateService.sameValueToUTC(formValue.fromDate, true);
			formValue.toDate = this.customDateService.sameValueToUTC(formValue.toDate, true);
			this.fetchInterviews(this.recruiter?.companyId, formValue, formValue.sortString);
		});
	}
}


@Component({
	selector: 'delete-dialog',
	template: `
		<div class="p-2">
			<h2 mat-dialog-title>Confirmation</h2>
			<mat-dialog-content style="font-weight: 600;">
				Would you like to update this interview status?
			</mat-dialog-content>
			<mat-dialog-actions class="justify-content-center">
				<button
					mat-button
					mat-dialog-close
					class="mx-4"
					style="background-color: red; color: white; width: 25%; font-size: 16px;">
					Cancel
				</button>
				<button
					class="mx-4"
					(click)="submit()"
					mat-button
					cdkFocusInitial
					style="background-color: green; color: white; width: 25%; font-size: 16px;">
					Ok
				</button>
			</mat-dialog-actions>
		</div>
	`,
	standalone: true,
	imports: [
		MatButtonModule,
		MatDialogActions,
		MatDialogClose,
		MatDialogTitle,
		MatDialogContent,
	],
})
export class ConfirmDialog {
	constructor(
		@Inject(MAT_DIALOG_DATA) public data: any,
		public dialogRef: MatDialogRef<ConfirmDialog>,
		private interviewService: InterviewService,
		private toastr: ToastrService,
	) { }

	private interviewId = this.data ? this.data.interviewId : null;
	private oldCompanyStatus = this.data ? this.data.oldCompanyStatus : null;
	public interview_CompanyStatus: typeof Interview_CompanyStatus = Interview_CompanyStatus;
	public interview_CandidateStatus: typeof Interview_CandidateStatus = Interview_CandidateStatus;

	public submit() {
		if (this.interviewId) {
			if (this.oldCompanyStatus) {
				if (this.oldCompanyStatus === this.interview_CompanyStatus.PASSED) {
					this.interviewService.updateStatus(this.interviewId, this.interview_CompanyStatus.PASSED_N_MAILED, this.interview_CandidateStatus.FINISHED)
						.subscribe({
							next: () => { },
							error: () => {
								this.toastr.error('Something wrong...', 'Error!!!', { toastClass: ' my-custom-toast ngx-toastr', });
							},
							complete: () => {
								this.dialogRef.close();
								this.toastr.success('Status updated...', 'Successfully!', {
									toastClass: ' my-custom-toast ngx-toastr',
									timeOut: 2000,
								});
							},
						})
				}
			}
		}
	}
}
