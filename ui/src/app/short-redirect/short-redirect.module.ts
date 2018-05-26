import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ShortRedirectRoutingModule } from "@app/short-redirect/short-redirect-routing.module";
import { ShortRedirectComponent } from "@app/short-redirect/short-redirect.component";

@NgModule({
  imports: [
    CommonModule,
    ShortRedirectRoutingModule
  ],
  declarations: [
    ShortRedirectComponent
  ]
})
export class ShortRedirectModule { }
