<?php

namespace App\Filament\Resources\BreakdownsResource\Pages;

use App\Filament\Resources\BreakdownsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBreakdowns extends EditRecord
{
    protected static string $resource = BreakdownsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
