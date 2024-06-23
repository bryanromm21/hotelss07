<?php

namespace App\Filament\Resources\DepartamentsResource\Pages;

use App\Filament\Resources\DepartamentsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditDepartaments extends EditRecord
{
    protected static string $resource = DepartamentsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
