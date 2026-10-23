import {
  booleanAttribute,
  ChangeDetectionStrategy,
  Component,
  computed,
  input,
} from '@angular/core';
import { LucideDynamicIcon, LucideIcon, LucideIconData } from '@lucide/angular';

export type ButtonVariant =
  | 'primary-dark'
  | 'primary-light'
  | 'primary-inverted'
  | 'accent-light'
  | 'accent-dark'
  | 'accent-inverted';

export type ButtonSize = 'sm' | 'md' | 'lg';

// Either an icon component (LucideArrowRight) or raw icon data
export type ButtonIcon = LucideIcon | LucideIconData;

@Component({
  selector: 'button[appButton]', //binds element to html's default <button> tag
  imports: [LucideDynamicIcon],
  templateUrl: './button.html',
  styleUrl: './button.css',
  changeDetection: ChangeDetectionStrategy.OnPush,
  host: {
    '[attr.data-variant]': 'variant()',
    '[attr.data-size]': 'size()',
    '[class.icon-only]': 'iconOnly()',
  },
})
export class ButtonComponent {
  readonly variant = input<ButtonVariant>('primary-dark');
  readonly size = input<ButtonSize>('md');
  readonly iconLeft = input<ButtonIcon | null>(null);
  readonly iconRight = input<ButtonIcon | null>(null);
  readonly iconOnly = input(false, { transform: booleanAttribute });

  protected readonly iconSize = computed(() => ({ sm: 14, md: 16, lg: 20 })[this.size()]);

  protected readonly leadingIcon = computed(() =>
    this.iconOnly() ? (this.iconLeft() ?? this.iconRight()) : this.iconLeft(),
  );
  protected readonly trailingIcon = computed(() => (this.iconOnly() ? null : this.iconRight()));
}
