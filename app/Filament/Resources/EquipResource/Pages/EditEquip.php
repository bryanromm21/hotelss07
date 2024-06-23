<?php

namespace App\Filament\Resources\EquipResource\Pages;

use App\Filament\Resources\EquipResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditEquip extends EditRecord
{
    protected static string $resource = EquipResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
