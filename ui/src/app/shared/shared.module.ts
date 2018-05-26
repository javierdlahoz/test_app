import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from "@angular/forms";

import { LoaderComponent } from './loader/loader.component';
import { UrlFormComponent } from "@app/shared/url-form/url-form.component";
import { UrlListComponent } from "@app/shared/url-list/url-list.component";

@NgModule({
  imports: [
    CommonModule,
    FormsModule
  ],
  declarations: [
    LoaderComponent,
    UrlFormComponent,
    UrlListComponent
  ],
  exports: [
    LoaderComponent,
    UrlFormComponent,
    UrlListComponent
  ]
})
export class SharedModule { }
