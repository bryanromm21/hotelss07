<?php

namespace App\Filament\Resources\EquipResource\Pages;

use App\Filament\Resources\EquipResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListEquips extends ListRecords
{
    protected static string $resource = EquipResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
