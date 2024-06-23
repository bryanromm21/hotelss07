<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrdersResource\Pages;
use App\Filament\Resources\OrdersResource\RelationManagers;
use App\Models\Orders;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrdersResource extends Resource
{
    protected static ?string $model = Orders::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Pedidos';
    protected static ?string $modelLabel = 'Pedidos';
    protected static ?string $navigationGroup = 'Almacen ';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                    Forms\Components\DatePicker::make('date')
                    ->label('fecha')
                    ->required(),

                    Forms\Components\Select::make('personals_id')
                    ->label('personal')
                    ->relationship('personals','name')
                    ->required()
                    ->searchable()
                    ->preload(),
                    Forms\Components\Select::make('departaments_id')
                    ->label('departamento')
                    ->relationship('departaments','departaments')
                    ->required()
                    ->searchable()
                    ->preload(),
                    Forms\Components\Select::make('products_id')
                    ->label('producto')
                    ->relationship('products','products')
                    ->required()
                    ->searchable()
                    ->preload(),
                    Forms\Components\TextInput::make('amount')
                    ->label('cantidad')
                    ->required()
                    ->numeric(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                    Tables\Columns\TextColumn::make('date')
                    ->label('fecha')
                    ->date()
                    ->sortable(),
                    
                    Tables\Columns\TextColumn::make('products.category.categories')
                    ->label('categoria')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('products.products')
                    ->label('producto')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('products.brand')
                    ->label('MArca')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('amount')
                    ->label('cantidad')
                    ->numeric()
                    ->sortable(),
                    
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
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrders::route('/create'),
            'edit' => Pages\EditOrders::route('/{record}/edit'),
        ];
    }
}
