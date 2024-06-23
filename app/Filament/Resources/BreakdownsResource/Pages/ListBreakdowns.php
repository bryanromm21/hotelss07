<?php

namespace App\Filament\Resources\BreakdownsResource\Pages;

use App\Filament\Resources\BreakdownsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListBreakdowns extends ListRecords
{
    protected static string $resource = BreakdownsResource::class;

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
    }
        public function getTabs(): array
    {
        return [
            'all' => Tab::make(label:'todos'),
            
                'rooms_id' => Tab::make(label:'habitaciones')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('rooms_id', true)),
                'specials_areas_id' => Tab::make(label:'areas')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('specials_areas_id', true)),
                
                
        ];
    }
}
