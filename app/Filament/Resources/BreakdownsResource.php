<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BreakdownsResource\Pages;
use App\Filament\Resources\BreakdownsResource\RelationManagers;
use App\Models\Breakdowns;
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
use Filament\Forms\Components\DateTimePicker;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Fields\Date;
use Filament\Forms\Fields\Number;
use Forms\Components\Textarea;

class BreakdownsResource extends Resource
{
    protected static ?string $model = Breakdowns::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Averias';
    protected static ?string $modelLabel = 'Averias';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Textarea::make('description')
                ->label('descripcion')
                    ->required()
                    ->columnSpanFull(),
                    Forms\Components\DateTimePicker::make('date_breakdowns')
                    ->label('fecha_averia')
                    ->required(),
                    Forms\Components\TagsInput::make('state')
                    ->label('estado')
                ->label('estado')
                ->suggestions([
                    'Limpio',
                    'Sucio',
                    'Ocupado',
                    'Desocupado',
                    'Mantanimiento',
                    ]),
                            Forms\Components\Select::make('priority')
                            ->label('prioridad')
                        ->label('prioridad')
                                    ->options(breakdowns::$priority)
                                    ->required()
                            ->searchable()
                                    ->preload(),
                Forms\Components\FileUpload::make('photo')
                ->label('foto')
                ->image()
                ->visibility('private')
                ->directory('breakdowns')
                ->preserveFilenames(),

                Forms\Components\Select::make('personals_id')
                ->label('personal')
                ->relationship('personals','name')
                ->required()
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('rooms_id')
                ->label('numero de habitacion')
                ->relationship('rooms','rooms_number')
                
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('departaments_id')
                ->label('departamento')
                ->relationship('departaments','departaments')
                ->required()
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('specials_areas_id')
                ->label('Area')
                ->relationship('specials_areas','Area')
                ->searchable()
                ->preload(),
                
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('date_breakdowns')
                ->label('fecha_averia')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('state')
                ->label('estado'),
                Tables\Columns\TextColumn::make('priority')->label('prioridad'),
                Tables\Columns\ImageColumn::make('photo')
                ->label('foto')
                ->rounded(),
                Tables\Columns\TextColumn::make('personals.name')
                ->label('personal')
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
                Tables\Columns\TextColumn::make('rooms.rooms_number')
                ->label('numero de habitacion')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('specials_areas.Area')
                ->label('Area')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('departaments.departaments')
                ->label('departamento')
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
            'index' => Pages\ListBreakdowns::route('/'),
            'create' => Pages\CreateBreakdowns::route('/create'),
            'edit' => Pages\EditBreakdowns::route('/{record}/edit'),
        ];
    }
}
