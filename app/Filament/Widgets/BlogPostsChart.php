<?php

namespace App\Filament\Widgets;
use App\Models\activity;
use Filament\Widgets\ChartWidget;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;
class BlogPostsChart extends ChartWidget
{
    protected static ?string $heading = 'Actividades';
    protected int | string | array $columnSpan = 1;

    protected function getData(): array
    {
        $data=Trend::model(activity::class)
        ->between(
            start: now()->subMonths(6),
            end: now(),
        )
        ->perMonth()
        ->count();
        //dd($data);
        return [
            'datasets' => [
                [
                    'label' => 'Fecha de creacion',
                    'data' => $data->map(fn (TrendValue $value) => $value->aggregate),
                ],
            ],
            'labels' => $data->map(fn (TrendValue $value) => $value->date),
        
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
