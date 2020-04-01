<?php

declare(strict_types=1);

namespace Tests;

use Dries\Icons\BladeIconsServiceProvider;
use Illuminate\Support\Facades\View;
use Orchestra\Testbench\TestCase;

class CompilesIconsTest extends TestCase
{
    /** @test */
    public function it_compiles_a_single_anonymous_component()
    {
        $result = trim(View::file(__DIR__.'/stubs/single-anonymous-component.blade.php')->render());

        // Note: the empty class here seems to be a Blade components bug.
        $expected = <<<SVG
<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" class="" style="">
  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"/>
</svg>
SVG;

        $this->assertSame($expected, $result);
    }

    /** @test */
    public function it_can_add_classes_to_icons()
    {
        $result = trim(View::file(__DIR__.'/stubs/icons-with-classes.blade.php')->render());

        $expected = <<<SVG
<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-6 h-6 text-gray-500" style="">
  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"/>
</svg>
SVG;

        $this->assertSame($expected, $result);
    }

    /** @test */
    public function it_can_add_styles_to_icons()
    {
        $result = trim(View::file(__DIR__.'/stubs/icons-with-styles.blade.php')->render());

        $expected = <<<SVG
<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" class="" style="color: #555">
  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"/>
</svg>
SVG;

        $this->assertSame($expected, $result);
    }

    protected function getPackageProviders($app)
    {
        return [BladeIconsServiceProvider::class];
    }
}
