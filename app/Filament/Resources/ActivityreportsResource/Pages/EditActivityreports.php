<?php

namespace App\Filament\Resources\ActivityreportsResource\Pages;

use App\Filament\Resources\ActivityreportsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditActivityreports extends EditRecord
{
    protected static string $resource = ActivityreportsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
