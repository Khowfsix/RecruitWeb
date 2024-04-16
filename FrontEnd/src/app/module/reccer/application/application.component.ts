/* eslint-disable @typescript-eslint/no-explicit-any */
import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Application } from '../../../data/application/application.model';
import { ApplicationService } from '../../../data/application/application.service';
import { AsyncPipe, DatePipe } from '@angular/common';
import { CommonModule } from '@angular/common';
import { CandidateService } from '../../../data/candidate/candidate.service';
import { MatFormField, MatLabel } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { MatInput } from '@angular/material/input';
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { Subject, debounceTime, forkJoin, startWith } from 'rxjs';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { BlackListService } from '../../../data/blacklist/blacklist.service';
import { BlackList } from '../../../data/blacklist/blacklist.model';
import { MatIcon, MatIconModule } from '@angular/material/icon';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatButtonModule } from '@angular/material/button';
import { MatRippleModule } from '@angular/material/core';
import { MatMenuModule } from '@angular/material/menu';
import { Candidate } from '../../../data/candidate/candidate.model';
import { Skill } from '../../../data/skill/skill.model';
import { ApplicationHistoryService } from '../../../data/applicationHistory/applicationHistory.service';
import { MatDialog } from '@angular/material/dialog';
import { ApplicationHistoryComponent } from './application-history/application-history.component';
import { CandidateJoinEventService } from '../../../data/candidateJoinEvent/candidate-join-event.service';

@Component({
	selector: 'app-application',
	standalone: true,
	imports: [
		AsyncPipe,
		MatMenuModule,
		MatRippleModule,
		MatIconModule,
		MatButtonModule,
		MatSlideToggleModule,
		MatTooltipModule,
		MatIcon,
		MatCheckboxModule,
		ReactiveFormsModule,
		MatInput,
		MatSelectModule,
		MatLabel,
		MatFormField,
		DatePipe,
		CommonModule,
	],
	templateUrl: './application.component.html',
	styleUrl: './application.component.css'
})
export class ApplicationComponent implements OnInit {
	constructor(
		private route: ActivatedRoute,
		private formBuilder: FormBuilder,
		private dialog: MatDialog,
		private viewContainerRef: ViewContainerRef,
		private candidateJoinEventService: CandidateJoinEventService,
		private applicationService: ApplicationService,
		private candidateService: CandidateService,
		private blackListService: BlackListService,
		private applicationHistoryServivce: ApplicationHistoryService,
	) { }

	public paramPositionId!: string;
	public fetchedApplications?: Application[];
	public fetchedBlackLists?: BlackList[];
	public fetchedCandidates?: Candidate[];
	public fetchedSkills?: Skill[];
	public sortString?: string;

	public filterForm: FormGroup = this.formBuilder.group({
		sortString: ['DateTime_DESC', []],
		search: ['', []],
		notInBlackList: [false, []]
	});

	public openViewApplicationHistoryDialog(candidateId: string | undefined, enterAnimationDuration: string,
		exitAnimationDuration: string) {
		if (candidateId) {
			const applicationHistory$ = this.applicationHistoryServivce.getByCandidateId(candidateId);
			const candidateJoinEvent$ = this.candidateJoinEventService.getAllByCandidateId(candidateId);

			forkJoin([applicationHistory$, candidateJoinEvent$]).subscribe(([applicationHistoryData, candidateJoinEventData]) => {
				// console.log("openViewApplicationHistoryDialog - Application History", applicationHistoryData);
				// console.log("openViewApplicationHistoryDialog - Candidate Join Event", candidateJoinEventData);

				this.dialog.open(ApplicationHistoryComponent, {
					viewContainerRef: this.viewContainerRef,
					data: {
						applicationHistoryData: applicationHistoryData,
						candidateJoinEventData: candidateJoinEventData,
					},
					width: '600px',
					height: '600px',
					enterAnimationDuration,
					exitAnimationDuration,
				});
			});
		}
	}

	public isInBlackList(candidateId: string | undefined) {
		return this.fetchedBlackLists?.some(x => x.candidateId === candidateId);
	}

	public handleSortSelect(event: Event) {
		const selectedOption = event.target as HTMLSelectElement;
		const value = selectedOption.value;

		this.sortString = value;
		// this.fetchedAllPositions(this.formatFilterModel(this.filterForm.value));
	}

	private getAllBlackList() {
		this.blackListService.getAll().subscribe((data) => {
			this.fetchedBlackLists = data;
		});
	}

	private getAllApplicationsByPositionId(positionId: string, formValue?: any) {
		// console.log('formValue', formValue)
		this.applicationService.getAllByPositionId(positionId, formValue ? formValue.search : '',
			formValue ? formValue.sortString : '', formValue ? formValue.notInBlackList : '').subscribe((data) => {
				this.fetchedApplications = data;
				this.fetchedApplications.forEach(application => {
					if (application.cv?.candidateId) {
						this.candidateService.getById(application.cv?.candidateId).subscribe(candidate => {
							if (application.cv)
								application.cv.candidate = candidate;
						});
					}
				});
			});

		// console.log('fetchedCandidates', this.fetchedCandidates)
		// console.log('fetchedApplications', this.fetchedApplications)
	}

	private filterSubject = new Subject<any>();

	public ngOnInit(): void {
		this.paramPositionId = this.route.snapshot.paramMap.get('positionId') ?? '';
		this.getAllApplicationsByPositionId(this.paramPositionId);
		this.getAllBlackList();

		this.filterForm.valueChanges
			.pipe(startWith(null))
			.subscribe(() => {
				const formValue = this.filterForm.value;
				this.filterSubject.next(formValue);
			})

		this.filterSubject.pipe(debounceTime(300)).subscribe((formValue) => {
			this.getAllApplicationsByPositionId(this.paramPositionId, formValue);
		});
	}
}