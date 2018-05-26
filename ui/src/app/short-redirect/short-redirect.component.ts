import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";

import { UrlService } from "@app/core/services/url.service";

@Component({
  selector: 'app-short-redirect',
  template: `<span>Redirecting...</span>`
})
export class ShortRedirectComponent implements OnInit {

  constructor(private urlService: UrlService,
              private route: Router,
              private activatedRoute: ActivatedRoute) {
    this.activatedRoute.params.subscribe((params) => {
      if (params.shortUrl) {
        this.getUrl(params.shortUrl);
      } else {
        this.redirectToHome();
      }
    });
  }

  ngOnInit() {

  }

  private getUrl(shortUrl: string) {
    this.urlService.getUrlByShortHash(shortUrl).subscribe(
      (url) => {
        window.location.href = url.full_url
      },
      () => {
        this.redirectToHome();
      });
  }

  private redirectToHome() {
    this.route.navigate(['/home']);
  }

}
