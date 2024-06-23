<?php

namespace App\Filament\Widgets;
use App\Models\User;
use App\Models\Lost;
use App\Models\breakdowns;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('User', User::query()->count())
            ->description('Usuarios')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->chart([7, 2, 10, 3, 15, 4, 17])
            ->color('success'),
        Stat::make('Perdidos', Lost::query()->count())
            ->description('Objetos Perdidos')
            ->descriptionIcon('heroicon-m-arrow-trending-down')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->chart([7, 2, 10, 3, 15, 4, 17])
            ->color('success'),
        Stat::make('Averias', breakdowns::query()->count())
            ->description('Averias')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->chart([7, 2, 10, 3, 15, 4, 17])
            ->color('success'),
        ];
    }
}
