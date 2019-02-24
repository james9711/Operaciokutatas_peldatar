import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-chapter2',
  templateUrl: './chapter2.component.html',
  styleUrls: ['./chapter2.component.css', '../app.component.css']
})
export class Chapter2Component implements OnInit {

  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
  thirdFormGroup: FormGroup;
  fourthFormGroup: FormGroup;

  constructor(private appComp: AppComponent, private _formBuilder: FormBuilder) { }

  ngOnInit() {
    this.firstFormGroup = this._formBuilder.group({firstCtrl: ['', Validators.required]});
    this.secondFormGroup = this._formBuilder.group({secondCtrl: ['', Validators.required]});
    this.thirdFormGroup = this._formBuilder.group({secondCtrl: ['', Validators.required]});
    this.fourthFormGroup = this._formBuilder.group({secondCtrl: ['', Validators.required]});
  }

  downloadFailedSnackBar(): void {
    this.appComp.basicDownloadFailedSnackBar();
  }

  downloadSuccessSnackBar(): void {
    this.appComp.basicDownloadSuccessSnackBar();
  }

  //R codes
  downloadRcode2_1(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_01.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_2(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_02.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_3(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_03.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_4(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_04.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_5(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_05.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_6(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_06.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_7(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_07.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_8(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_08.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_9(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_09.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_10(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_10.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_11(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_11.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_12(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_12.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_13(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_13.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_14(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_14.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_15(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_15.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_16(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_16.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_17(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_17.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode2_18(){
    window.open("../../assets/sources/files/kodok/r/2 fejezet feladatai/II_18.R");
    window.location.href='../../assets/sources/files/kodok/r/2 fejezet feladatai/SZM.18.R';
    this.downloadSuccessSnackBar();
  }

  //Lingo codes
  downloadLingocode2_1(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_2(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_3(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_4(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_5(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_6(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_7(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_8(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_9(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_10(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_11(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_12(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_13(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_14(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_15(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_16(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_17(){
    this.downloadFailedSnackBar();
  }

  downloadLingocode2_18(){
    this.downloadFailedSnackBar();
  }

  //SAS/ OR codes
  downloadSascode2_1(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.1.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_2(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.2.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_3(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.3.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_4(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.4.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_5(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.5.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_6(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.6.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_7(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.7.sas");
    this.downloadSuccessSnackBar();
  }
  
  downloadSascode2_8(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.8.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_9(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.9.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_10(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.10.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_11(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.11.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_12(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.12.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_13(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.13.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_14(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.14.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_15(){
    window.open("../../assets/sources/files/kodok/sas or/2 fejezet feladatai/SZM.15.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode2_16(){
    this.downloadFailedSnackBar();
  }

  downloadSascode2_17(){
    this.downloadFailedSnackBar();
  }

  downloadSascode2_18(){
    this.downloadFailedSnackBar();
  }

}
