import { Component, OnInit } from '@angular/core';
import { UrlService, Url } from "@app/core/services/url.service";

@Component({
  selector: 'app-url-form',
  templateUrl: './url-form.component.html',
  styleUrls: ['./url-form.component.scss']
})
export class UrlFormComponent implements OnInit {

  urlObject: Url;
  loading: boolean;
  newUrl: string;

  constructor(private urlService: UrlService) { }

  ngOnInit() {
    this.resetUrlObject();
  }

  createUrl() {
    this.loading = true;
    this.urlService.createUrl(this.urlObject).subscribe((url) => {
      this.loading = false;
      this.newUrl = url.full_short_url;
      this.resetUrlObject();
    });
  }

  private resetUrlObject() {
    this.urlObject = {full_url: '', domain: window.location.origin};
  }

}
