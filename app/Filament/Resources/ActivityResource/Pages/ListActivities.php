<?php

namespace App\Filament\Resources\ActivityResource\Pages;

use App\Filament\Resources\ActivityResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListActivities extends ListRecords
{
    protected static string $resource = ActivityResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
    public function getDefaultActiveTab(): string | int | null
    {
        return 'all';
        return 'personals_id';
        return 'rooms_id';
        return 'specials_areas_id';
        return 'equips_id';
    }
        public function getTabs(): array
    {
        return [
            'all' => Tab::make(label:'todos'),
            'date_activities' => Tab::make(label:'inicio actividades')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('date_activities', true)),
            'end_activities' => Tab::make(label:'fin actividades')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('nationality', true)),
                'personals_id' => Tab::make(label:'personal')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('personals_id', true)),
                'rooms_id' => Tab::make(label:'habitaciones')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('rooms_id', true)),
                'specials_areas_id' => Tab::make(label:'areas')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('specials_areas_id', true)),
                'equips_id' => Tab::make(label:'equipos')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('equips_id', true)),
                
        ];
    }
}
