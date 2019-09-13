import {Component, Inject, OnInit} from '@angular/core';
import {TaskService} from "../services/task.service";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material";
import {Task} from "../models/task.model";
import {Complexity} from "../models/complexity.model";
import {StatusService} from "../services/status.service";
import {EmployeeService} from "../services/employee.service";
import {ComplexityService} from "../services/complexity.service";
import {Employee} from "../models/employee.model";
import {Status} from "../models/status.model";
import {NgForm} from "@angular/forms";
import {ToastrService} from "ngx-toastr";

@Component({
    selector: 'app-popup-task',
    templateUrl: './popup-task.component.html',
    styles: []
})
export class PopupTaskComponent implements OnInit {

    formData: Task;
    employeeIndex: number;
    complexityIndex: number;
    statusIndex: number;
    editValue: boolean = false;

    constructor(@Inject(MAT_DIALOG_DATA) public data,
                public dialogRef: MatDialogRef<PopupTaskComponent>,
                private  taskService: TaskService,
                private statusService: StatusService,
                private  employeeService: EmployeeService,
                private  complexityService: ComplexityService,
                private toastr: ToastrService) {
    }

    ngOnInit() {

        if (this.data.task == null) {
            this.formData = {
                Name: null,
                Id: null,
                StartDate: null,
                EndDate: null,
                Description: null,
                ComplexityId: null,
                EmployeeId: null,
                StatusId: null

            };

            this.complexityIndex = 1;
            this.employeeIndex = 1;
            this.statusIndex = 1;

        } else {

            this.formData = Object.assign({}, this.data.task);
            this.complexityIndex = this.data.task.Complexity.Id;
            this.employeeIndex = this.data.task.Employee.Id;
            this.statusIndex = this.data.task.Status.Id;
            this.editValue = true;
        }
    }

    onSubmit(form: NgForm) {

        if (this.editValue) {

            this.taskService.putTask(form.value).subscribe(() => this.toastr.info("Edited successfully"));
        } else {
            this.taskService.postTask(form.value).subscribe(() => this.toastr.success("Added successfully"));
        }

        this.dialogRef.close();

    }


}
