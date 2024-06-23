<?php

namespace App\Filament\Resources;

use App\Filament\Resources\RoomResource\Pages;
use App\Filament\Resources\RoomResource\RelationManagers;
use App\Models\Room;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Models\Person;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\TagsInput;
use Filament\Tables\Columns\TextColumn;
class RoomResource extends Resource
{
    protected static ?string $model = Room::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Habitaciones';
    protected static ?string $modelLabel = 'Habitaciones';
    protected static ?string $navigationGroup = 'Gestion Habitaciones';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Textarea::make('rooms')
                ->label('Habitacion')
                ->label('Descripcion de habitacion')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\Textarea::make('rooms_number')
                ->label('Numenro')
                ->label('Numero habitacion')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('rooms_price')
                ->label('Precio')
                ->label('Precio Habitacion')
                    ->required()
                    ->numeric(),
                    Forms\Components\Select::make('rooms_type')
                    ->label('Habitacion')
                ->label('Tipo de habitacion')
                            ->options(room::$roomType)
                            ->required()
                    ->searchable()
                            ->preload(),
                Forms\Components\TextInput::make('capacity')
                ->label('Capacidad')
                ->label('Capacidad de habitacion')
                    ->required()
                    ->numeric(),
                    Forms\Components\TagsInput::make('state')
                    ->label('estado')
                ->label('Estado')
                            ->suggestions([
                            'Limpio',
                            'Sucio',
                            'Ocupado',
                            'Desocupado',
                            'Mantanimiento',
                            ])
                            
                    
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('rooms_number')
                ->label('Habitacion')
                ->label('Numero de habitacion'),
                Tables\Columns\TextColumn::make('rooms')
                ->label('Habitacion')
                ->label('Descripcion de habitacion')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('rooms_price')
                    ->label('Numenro')
                ->label('Precio habitacion')
                    ->numeric()
                    ->sortable()->searchable(),
                Tables\Columns\TextColumn::make('rooms_type')
                ->label('Habitacion')
                ->label('Tipo de habitacion')
                ->searchable() ,
                Tables\Columns\TextColumn::make('capacity')
                ->label('Capacidad')
                ->label('Capacidad')
                    
                    ->sortable(),
                Tables\Columns\TextColumn::make('state')
                ->label('Estado')
                ->label('Estado')->searchable(),
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
public function getEnumOptions(): array
    {
        
        return room::enumType(); 
        
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListRooms::route('/'),
            'create' => Pages\CreateRoom::route('/create'),
            'edit' => Pages\EditRoom::route('/{record}/edit'),
        ];
    }
}
