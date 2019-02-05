import {MatButtonModule, MatCheckboxModule, MatDividerModule, MatListModule, MatSnackBarModule } from '@angular/material';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatIconModule} from '@angular/material/icon';
import { NgModule } from '@angular/core';

@NgModule({
  imports: [MatButtonModule, MatCheckboxModule, MatToolbarModule, MatIconModule, MatDividerModule, MatListModule, MatSnackBarModule ],
  exports: [MatButtonModule, MatCheckboxModule, MatToolbarModule, MatIconModule, MatDividerModule, MatListModule, MatSnackBarModule ],
})
export class MaterialModule { }