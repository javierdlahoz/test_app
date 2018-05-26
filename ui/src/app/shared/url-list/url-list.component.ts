import { Component, OnInit } from '@angular/core';
import { UrlService, Url } from "@app/core/services/url.service";

@Component({
  selector: 'app-url-list',
  templateUrl: './url-list.component.html',
  styleUrls: ['./url-list.component.scss']
})
export class UrlListComponent implements OnInit {

  urlList: Url[];
  loading: boolean;

  constructor(private urlService: UrlService) { }

  ngOnInit() {
    this.fetchUrlList();
  }

  private fetchUrlList() {
    this.loading = true;
    this.urlService.fetchTop100().subscribe((list) => {
      this.loading = false;
      this.urlList = list.urls
    });
  }

}
