/* eslint-disable @typescript-eslint/no-explicit-any */
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export const baseUrl = 'https://localhost:7029';
// const baseUrl = 'https://jasminerecruitmentweb.azurewebsites.net';

@Injectable({
	providedIn: 'root',
})
export class API {
	constructor(private http: HttpClient) { }

	public GET(path: string): Observable<any[] | any> {
		return this.http.get<any[]>(baseUrl + path);
	}

	public POST(path: string, data?: any, options?: any): Observable<any> {
		return this.http.post(baseUrl + path, data, options);
	}

	public PUT(path: string, data?: any): Observable<any> {
		return this.http.put(baseUrl + path, data);
	}

	public DELETE(path: string, body?: any): Observable<any> {
		return this.http.delete(baseUrl + path, { body: body });
	}
}
