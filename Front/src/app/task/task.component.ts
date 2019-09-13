import {Component, OnInit, ViewChild} from '@angular/core';
import {Task} from "../models/task.model";
import {TaskService} from "../services/task.service";
import {ComplexityService} from "../services/complexity.service";
import {EmployeeService} from "../services/employee.service";
import {StatusService} from "../services/status.service";
import {MatDialog, MatDialogConfig, MatPaginator, MatSort, MatTableDataSource} from "@angular/material";
import {PopupTaskComponent} from "../popup-task/popup-task.component";
import {Complexity} from "../models/complexity.model";
import {Employee} from "../models/employee.model";
import {Status} from "../models/status.model";
import {ToastrService} from "ngx-toastr";

@Component({
    selector: 'app-task',
    templateUrl: './task.component.html',
    styles: []
})
export class TaskComponent implements OnInit {

    displayedColumns: string[] = ['Name', 'Description', 'Complexity.Name', 'StartDate', 'EndDate', 'Employee', 'Phone', 'Status', 'Buttons'];

    dataSource = new MatTableDataSource();

    @ViewChild(MatSort, {static: true}) sort: MatSort;
    @ViewChild(MatPaginator, null) paginator: MatPaginator;

    constructor(private taskService: TaskService,
                private dialog: MatDialog,
                private statusService: StatusService,
                private  employeeService: EmployeeService,
                private  complexityService: ComplexityService,
                private toastr: ToastrService
    ) {}

    ngOnInit() {

        this.refreshList();

        this.complexityService.getComplexity().subscribe(res => this.complexityService.complexityList = res as Complexity[]);
        this.employeeService.getEmployee().subscribe(res => this.employeeService.employeeList = res as Employee[]);
        this.statusService.getStatus().subscribe(res => this.statusService.statusList = res as Status[]);

    }

    refreshList() {
        this.taskService.getTaskList().subscribe(res => {

            this.dataSource.sortingDataAccessor = this.sortingDataAccessor;
            this.dataSource.sort = this.sort;
            this.dataSource.paginator = this.paginator;

            this.dataSource.filterPredicate = function (data: Task, filter: string): boolean {
                return data.Name.toLowerCase().includes(filter);
            };
            this.dataSource.data = res as Task[];
        });
    }

    addOrEditTask(task?: Task) {

        const dialogConfig = new MatDialogConfig();
        dialogConfig.autoFocus = true;
        dialogConfig.disableClose = false;
        dialogConfig.width = "40%";
        dialogConfig.height = "75%";
        dialogConfig.data = {task};

        this.dialog.open(PopupTaskComponent, dialogConfig).afterClosed().subscribe(res =>
            setTimeout(()=>this.refreshList(), 100)
        );
    }

    deleteTask(id: number) {
        if (confirm("Are you sure to delete this task?")) {

            this.taskService.deleteTask(id).subscribe(() => {
                this.refreshList();
                this.toastr.error("Deleted successfully")
            });
        }
    }

    applyFilter(filterValue: string) {
        this.dataSource.filter = filterValue.trim().toLowerCase();
    }


    sortingDataAccessor(item, property) {
        if (property.includes('.')) {
            return property.split('.')
                .reduce((object, key) => object[key], item);
        }
        return item[property];
    }


}
