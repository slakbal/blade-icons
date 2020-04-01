# Upgrade Guide

## Upgrading from 1.x to 2.x

With 2.0, Zondicons are added alongside Heroicons. It also renames the package to the more general name of "Blade Icons".

- Replace `driesvints/blade-heroicons` with `driesvints/blade-icons` in your `composer.json`
- Rename your Heroicons from `icon-s-name` to `heroicon-s-name`
- Reference your raw icons as `vendor/blade-icons/heroicons/heroicon-s-name.svg` instead
