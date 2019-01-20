import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { Chapter1Component } from './chapter1/chapter1.component';
import { Chapter2Component } from './chapter2/chapter2.component';
import { Chapter3Component } from './chapter3/chapter3.component';
import { Chapter4Component } from './chapter4/chapter4.component';
import { Chapter5Component } from './chapter5/chapter5.component';
import { Chapter6Component } from './chapter6/chapter6.component';
import { Chapter7Component } from './chapter7/chapter7.component';
import { TartalomjegyzekComponent } from './tartalomjegyzek/tartalomjegyzek.component';

const routes: Routes = [
  { path: 'chapter1', component: Chapter1Component },
  { path: 'chapter2', component: Chapter2Component },
  { path: 'chapter3', component: Chapter3Component },
  { path: 'chapter4', component: Chapter4Component },
  { path: 'chapter5', component: Chapter5Component },
  { path: 'chapter6', component: Chapter6Component },
  { path: 'chapter7', component: Chapter7Component },
  { path: 'tartalomjegyzek', component: TartalomjegyzekComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const routingComponents = [Chapter1Component, Chapter2Component, Chapter3Component, Chapter4Component, Chapter5Component, Chapter6Component, Chapter7Component, TartalomjegyzekComponent]
