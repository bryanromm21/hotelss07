<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderreportsResource\Pages;
use App\Filament\Resources\OrderreportsResource\RelationManagers;
use App\Models\Orderreports;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrderreportsResource extends Resource
{
    protected static ?string $model = Orderreports::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Informe de Pedidos';
    protected static ?string $modelLabel = 'Informe de Pedidos';
    protected static ?string $navigationGroup = 'Informes';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('personals_id')
                ->label('Personal')
                ->relationship('personals','name')
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('departaments_id')
                ->label('departamento')
                ->relationship('departaments','departaments')
                ->required()
                ->searchable()
                ->preload(),
                Forms\Components\DatePicker:: make('date')
                ->label('fecha')
                ->required(),
                Forms\Components\Select::make('categories_id')
                ->label('categoria')
                ->relationship('categories','categories')
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('products_id')
                ->label('producto')
                ->relationship('products','products')
                ->searchable()
                ->preload(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('personals.name')
                    ->label('Personal')
                        ->numeric()
                        ->sortable(),
                        Tables\Columns\TextColumn::make('personals.positions.positions')
                ->label('cargo')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('departaments.departaments')
                ->label('departamento')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('categories.categories')
                ->label('categoria')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('products.products')
                ->label('producto')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('date')->date()->label('fecha')->sortable(),    
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
            'index' => Pages\ListOrderreports::route('/'),
            'create' => Pages\CreateOrderreports::route('/create'),
            'edit' => Pages\EditOrderreports::route('/{record}/edit'),
        ];
    }
}
