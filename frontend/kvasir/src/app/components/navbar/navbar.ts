import { Component } from '@angular/core';
import { LucideSearch } from '@lucide/angular';
import { ButtonComponent } from '../shared/ui/button/button';

@Component({
  imports: [LucideSearch, ButtonComponent],
  selector: 'app-navbar',
  styleUrl: './navbar.css',
  templateUrl: './navbar.html',
})
export class Navbar {
  protected readonly Search = LucideSearch;
}
