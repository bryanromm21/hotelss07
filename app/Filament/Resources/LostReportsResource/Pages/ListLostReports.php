<?php

namespace App\Filament\Resources\LostReportsResource\Pages;

use App\Filament\Resources\LostReportsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListLostReports extends ListRecords
{
    protected static string $resource = LostReportsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
    public function getDefaultActiveTab(): string | int | null
    {
        return 'all';
       
        return 'rooms_id';
        return 'specials_areas_id';
        return 'descripcion';
    }
        public function getTabs(): array
    {
        return [
            'all' => Tab::make(label:'todos'),
            
                'rooms_id' => Tab::make(label:'habitaciones')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('rooms_id', true)),
                'specials_areas_id' => Tab::make(label:'areas')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('specials_areas_id', true)),
                'descripcion' => Tab::make(label:'descripcion')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('descripcion', true)),
                
        ];
    }
}
