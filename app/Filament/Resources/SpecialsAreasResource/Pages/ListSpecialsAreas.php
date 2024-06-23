<?php

namespace App\Filament\Resources\SpecialsAreasResource\Pages;

use App\Filament\Resources\SpecialsAreasResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSpecialsAreas extends ListRecords
{
    protected static string $resource = SpecialsAreasResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
