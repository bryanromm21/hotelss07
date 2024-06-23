<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LostResource\Pages;
use App\Filament\Resources\LostResource\RelationManagers;
use App\Models\Lost;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Columns\ImageColumn;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
class LostResource extends Resource
{
    protected static ?string $model = Lost::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Perdidos';
    protected static ?string $modelLabel = 'Perdidos';
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //'descripcion','photo', 'departamento', 'cargo', 'date of foud','personals_id', 'rooms_id' 
                Forms\Components\TextInput :: make('descripcion')
                ->required()
                ->maxLength(255),
                FileUpload::make('photo')
                ->label('foto')
                    ->image()
                    ->visibility('private')
                    ->directory('lost')
                    ->preserveFilenames(),
                    Forms\Components\Select::make('departaments_id')
                    ->label('departamento')
                    ->relationship('departaments','departaments')
                    ->required()
                    ->searchable()
                    ->preload(),
                    
                Forms\Components\DatePicker:: make('date of foud')
                ->label('fecha')
                ->required(),
                Forms\Components\DatePicker:: make('date of return')
                ->label('fecha devolucion'),
                Forms\Components\Select::make('return_object')
                    ->label('Devolucion')
                            ->options(Lost::$lostType)
                            ->required()
                    ->searchable()
                            ->preload(),                            
                            //->multiple(),
                Forms\Components\Select :: make('personals_id')
                ->label('personal')
                ->relationship('personals','name')
                
                ->searchable()
                ->preload(),
                Forms\Components\Select :: make('rooms_id')
                ->label('habitacion')
                ->relationship('rooms','rooms')
                
                ->searchable()
                ->preload(),
            
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('descripcion')->searchable(),
                ImageColumn::make('photo')->rounded()
                ->label('foto'),
                TextColumn::make('departaments.departaments')->searchable()->label('departamento '),
                
                TextColumn::make('date of foud')->date()->label('fecha')->sortable(),
                TextColumn::make('date of return')->date()->label('fecha devoluvion')->sortable(),
                Tables\Columns\SelectColumn::make('return_object')
                    ->label('Devolucion')
                    ->options(Lost::$lostType) 
                    ->searchable(),
                Tables\Columns\TextColumn::make('personals.name')
                ->label('personal')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('rooms.rooms')
                ->label('habitacion')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('specials_areas.Area')
                ->label('Area')
                    ->numeric()
                    ->sortable(),
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
            'index' => Pages\ListLosts::route('/'),
            'create' => Pages\CreateLost::route('/create'),
            'edit' => Pages\EditLost::route('/{record}/edit'),
        ];
    }
}
