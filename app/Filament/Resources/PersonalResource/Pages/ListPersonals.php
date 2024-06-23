<?php

namespace App\Filament\Resources\PersonalResource\Pages;

use App\Filament\Resources\PersonalResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Pages\ListRecords\Tap;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListPersonals extends ListRecords
{
    protected static string $resource = PersonalResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
    public function getDefaultActiveTab(): string | int | null
{
    return 'all';
    return 'users_id';
}
    public function getTabs(): array
{
    return [
        'all' => Tab::make(label:'todos'),
        'ci' => Tab::make()
            ->modifyQueryUsing(fn (Builder $query) => $query->where('ci', true)),
        'nationality' => Tab::make(label:'nacionalidad')
            ->modifyQueryUsing(fn (Builder $query) => $query->where('nationality', true)),
            'users_id' => Tab::make(label:'usuarios')
            ->modifyQueryUsing(fn (Builder $query) => $query->where('users_id', true)),
            
    ];
}
}
