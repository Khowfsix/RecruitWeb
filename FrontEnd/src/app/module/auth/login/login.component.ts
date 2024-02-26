import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
	selector: 'app-login',
	standalone: true,
	templateUrl: './login.component.html',
	styleUrl: './login.component.scss',
	imports: [],
})
export class LoginComponent {
	constructor(private router: Router) {}

	hide: boolean = true;
}