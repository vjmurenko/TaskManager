import {Complexity} from "./complexity.model";
import {Status} from "./status.model";
import {Employee} from "./employee.model";

export class Task  {
    Id: number;
    Name: string;
    Description: string;
    ComplexityId: number;
    StartDate: Date;
    EndDate: Date;
    EmployeeId: number;
    StatusId: number;

    Complexity?: Complexity;
    Status?: Status;
    Employee?: Employee;



}
