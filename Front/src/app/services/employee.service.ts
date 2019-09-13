import { Injectable } from '@angular/core';
import {Employee} from "../models/employee.model";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  employeeList: Employee[];

  constructor(private httpService: HttpClient) { }

  getEmployee(){
    return this.httpService.get(environment.apiURL + '/Employee');
  }
}
