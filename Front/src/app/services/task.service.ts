import { Injectable } from '@angular/core';
import {Task} from "../models/task.model";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../environments/environment";


@Injectable({
  providedIn: 'root'
})
export class TaskService {

taskData: Task;
taskList: Task[];

  constructor(private httpClient: HttpClient) {
  }

  getTaskList(){
   return  this.httpClient.get(environment.apiURL+'/Task');
  }

  postTask(task: Task){
      return this.httpClient.post(environment.apiURL + '/Task', task);
  }

  putTask(task: Task){
      return this.httpClient.put(environment.apiURL + '/Task/' + task.Id, task);

  }

  deleteTask(id: number){
      return this.httpClient.delete(environment.apiURL + '/Task/'+ id);
  }

}
