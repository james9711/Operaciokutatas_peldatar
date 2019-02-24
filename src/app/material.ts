import {MatButtonModule, MatCheckboxModule, MatDividerModule, MatListModule, MatSnackBarModule } from '@angular/material';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatIconModule} from '@angular/material/icon';
import {NgModule} from '@angular/core';
import {MatStepperModule} from '@angular/material/stepper';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

@NgModule({
  imports: [MatButtonModule, MatCheckboxModule, MatToolbarModule, MatIconModule, MatDividerModule, MatListModule, MatSnackBarModule, MatStepperModule, FormsModule, ReactiveFormsModule ],
  exports: [MatButtonModule, MatCheckboxModule, MatToolbarModule, MatIconModule, MatDividerModule, MatListModule, MatSnackBarModule, MatStepperModule, FormsModule, ReactiveFormsModule ],
})
export class MaterialModule { }