<?php

namespace App\Filament\Resources\LostResource\Pages;

use App\Filament\Resources\LostResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListLosts extends ListRecords
{
    protected static string $resource = LostResource::class;

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
    }
        public function getTabs(): array
    {
        return [
            'all' => Tab::make(label:'todos'),
            'date of foud' => Tab::make(label:'fecha encontrado')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('date of foud', true)),
            'date of return' => Tab::make(label:'fecha devolucion')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('date of return', true)),
                'personals_id' => Tab::make(label:'personal')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('personals_id', true)),
                'rooms_id' => Tab::make(label:'habitaciones')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('rooms_id', true)),
                'specials_areas_id' => Tab::make(label:'areas')
                ->modifyQueryUsing(fn (Builder $query) => $query->where('specials_areas_id', true)),
                
                
        ];
    }
}
