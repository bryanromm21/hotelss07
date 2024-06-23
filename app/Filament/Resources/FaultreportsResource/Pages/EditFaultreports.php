<?php

namespace App\Filament\Resources\FaultreportsResource\Pages;

use App\Filament\Resources\FaultreportsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditFaultreports extends EditRecord
{
    protected static string $resource = FaultreportsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
