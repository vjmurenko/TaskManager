import { Injectable } from '@angular/core';
import {Status} from "../models/status.model";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class StatusService {

  statusList: Status[];

  constructor(private httpService: HttpClient) { }

  getStatus(){
    return this.httpService.get(environment.apiURL + '/Status');
  }
}
