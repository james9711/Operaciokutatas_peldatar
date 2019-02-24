import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-chapter4',
  templateUrl: './chapter4.component.html',
  styleUrls: ['./chapter4.component.css', '../app.component.css']
})
export class Chapter4Component implements OnInit {

  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;

  constructor(private appComp: AppComponent, private _formBuilder: FormBuilder) { }

  ngOnInit() {
    this.firstFormGroup = this._formBuilder.group({firstCtrl: ['', Validators.required]});
    this.secondFormGroup = this._formBuilder.group({secondCtrl: ['', Validators.required]});
  }

  downloadFailedSnackBar(): void {
    this.appComp.basicDownloadFailedSnackBar();
  }

  downloadSuccessSnackBar(): void {
    this.appComp.basicDownloadSuccessSnackBar();
  }

  //R codes
  downloadRcode4_1(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_01.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_2(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_02.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_3(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_03.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_4(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_04.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_5(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_05.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_6(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_06.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_7a(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_07a.R");
    window.location.href="../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_07.R";
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_7b(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_07b.R");
    window.location.href="../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_07.R";
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_8(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_08.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_9(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_09.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_10(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_10.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_11(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_11.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4_12(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_12.R");
    this.downloadSuccessSnackBar();
  }

  //Lingo codes
  downloadLingocode4_1(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.1.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_2(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.2.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_3(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.3.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_4(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.4.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_5(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.5.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_6(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.6.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_7a(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.7a.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_7b(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.7b.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_8a(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.8a.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_8b(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.8b.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_9(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.9.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_10(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.10.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_11(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.11.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4_12(){
    window.open("../../assets/sources/files/kodok/Lingo/4 fejezet feladatai/SZ.12.lg4");
    this.downloadSuccessSnackBar();
  }
  
  //SAS/ OR codes
  downloadSascode4_1(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.1.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_2(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.2.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_3(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.3.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_4(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.4.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_5(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.5.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_6(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.6.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_7a(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.7a.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_7b(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.7b.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_8a(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.8a.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_8b(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.8b.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_9(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.9.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_10(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.10.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_11(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.11.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4_12(){
    window.open("../../assets/sources/files/kodok/sas or/4 fejezet feladatai/SZ.12.sas");
    this.downloadSuccessSnackBar();
  }

}
