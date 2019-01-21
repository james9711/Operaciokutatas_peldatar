import {MatButtonModule, MatCheckboxModule, MatDividerModule, MatListModule} from '@angular/material';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatIconModule} from '@angular/material/icon';
import { NgModule } from '@angular/core';

@NgModule({
  imports: [MatButtonModule, MatCheckboxModule, MatToolbarModule, MatIconModule, MatDividerModule, MatListModule],
  exports: [MatButtonModule, MatCheckboxModule, MatToolbarModule, MatIconModule, MatDividerModule, MatListModule],
})
export class MaterialModule { }