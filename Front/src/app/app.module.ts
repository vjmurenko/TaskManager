import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';

import {AppComponent} from './app.component';
import {TaskComponent} from './task/task.component';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {TaskService} from "./services/task.service";
import {HttpClientModule} from "@angular/common/http";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {
    MatDialogModule,
    MatFormFieldModule, MatInputModule,
    MatPaginatorModule,
    MatSortModule,
    MatTableModule
} from "@angular/material";
import {ToastrModule} from "ngx-toastr";
import {PopupTaskComponent} from './popup-task/popup-task.component';
import {NgxMaskModule} from "ngx-mask-2";

@NgModule({
    declarations: [
        AppComponent,
        TaskComponent,
        PopupTaskComponent
    ],
    imports: [
        BrowserModule,
        FormsModule,
        HttpClientModule,
        BrowserAnimationsModule,
        MatDialogModule,
        ToastrModule.forRoot(),
        NgxMaskModule.forRoot(),
        ReactiveFormsModule,
        MatTableModule,
        MatSortModule,
        MatPaginatorModule,
        MatFormFieldModule,
        MatInputModule


    ],
    entryComponents: [PopupTaskComponent],
    providers: [TaskService],
    bootstrap: [AppComponent]
})
export class AppModule {
}
