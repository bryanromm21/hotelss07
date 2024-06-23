<?php

namespace App\Filament\Resources\OrderreportsResource\Pages;

use App\Filament\Resources\OrderreportsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditOrderreports extends EditRecord
{
    protected static string $resource = OrderreportsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
