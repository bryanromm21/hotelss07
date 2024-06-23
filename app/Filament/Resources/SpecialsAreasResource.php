<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SpecialsAreasResource\Pages;
use App\Filament\Resources\SpecialsAreasResource\RelationManagers;
use App\Models\specials_areas;
use App\Models\SpecialsAreas;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SpecialsAreasResource extends Resource
{
    protected static ?string $model = specials_areas::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Areas Especiales';
    protected static ?string $modelLabel = 'Areas Especiales';
    protected static ?string $navigationGroup = 'Gestion Habitaciones';
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('Area')
                ->required()
                ->maxLength(255),
            Forms\Components\TextInput::make('Ubicacion')
                ->required()
                ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('Area')
                    ->searchable(),
                    Tables\Columns\TextColumn::make('Ubicacion')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make()->label('vista'),
                Tables\Actions\EditAction::make()->label('Editar'),
                Tables\Actions\DeleteAction::make()->label('Borrar'),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSpecialsAreas::route('/'),
            'create' => Pages\CreateSpecialsAreas::route('/create'),
            'edit' => Pages\EditSpecialsAreas::route('/{record}/edit'),
        ];
    }
}
