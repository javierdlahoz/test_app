import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

export interface Url {
  full_url?: string,
  short_url?: string,
  counter?: number,
  full_short_url?: string,
  domain?: string
}

@Injectable()
export class UrlService {

  private endpoint: string;

  constructor(private http: HttpClient) {
    this.endpoint = `${environment.api}/urls`;
  }

  fetchTop100() :Observable<any> {
    return this.http.get<any>(this.endpoint);
  }

  createUrl(url: Url) :Observable<Url> {
    return this.http.post<Url>(this.endpoint, {url: url});
  }

  getUrlByShortHash(hash: string) :Observable<Url> {
    return this.http.get<Url>(`${this.endpoint}/${hash}`);
  }
}
