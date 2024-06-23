<?php

namespace App\Filament\Resources\RoomResource\Pages;

use App\Filament\Resources\RoomResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListRooms extends ListRecords
{
    protected static string $resource = RoomResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
    
    public function getTabs(): array
{
    return [
        'all' => Tab::make(label:'todos'),
        'rooms' => Tab::make(label:'Descrip.')
            ->modifyQueryUsing(fn (Builder $query) => $query->where('rooms', true)),
        'rooms_number' => Tab::make(label:'N°')
            ->modifyQueryUsing(fn (Builder $query) => $query->where('rooms_number', true)),
            'rooms_price' => Tab::make(label:'precio')
            ->modifyQueryUsing(fn (Builder $query) => $query->where('rooms_price', true)),
            'state' => Tab::make(label:'estado')
            ->modifyQueryUsing(fn (Builder $query) => $query->where('state', true)),
            
    ];
}
}
