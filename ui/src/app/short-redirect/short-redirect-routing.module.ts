import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { Route } from "@app/core";
import { ShortRedirectComponent } from "@app/short-redirect/short-redirect.component";

const routes: Routes = [
  { path: ':shortUrl', component: ShortRedirectComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: []
})
export class ShortRedirectRoutingModule { }
