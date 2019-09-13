import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Complexity} from "../models/complexity.model";
import {environment} from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class ComplexityService {

  complexityList: Complexity[];

  constructor(private httpService: HttpClient) { }

  getComplexity(){
    return this.httpService.get(environment.apiURL+'/Complexity');
  }
}
