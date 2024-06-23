<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ActivityResource\Pages;
use App\Filament\Resources\ActivityResource\RelationManagers;
use App\Models\Activity;
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
use Filament\Tables\Columns\SelectColumn;
class ActivityResource extends Resource
{
    protected static ?string $model = Activity::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Actividades';
    protected static ?string $modelLabel = 'Actividades';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\DateTimePicker::make('date_activities')
                ->label('Fecha de actividad')
                    ->required(),
                    Forms\Components\DateTimePicker::make('end_activities')
                    ->label('Fin de actividad')
                    ->required(),
                    Forms\Components\Select::make('descriptions_id')
                    ->label('descripcion')
                    ->relationship(name:'descriptions',titleAttribute:'description')
                    ->createOptionForm([
                        Forms\Components\TextInput::make('description')
                        ->required()
                    ]),
                    Forms\Components\Select::make('progress')
                    ->label('progreso')
                            ->options(activity::$activityType)
                            ->required()
                    ->searchable()
                            ->preload(),                            
                            //->multiple(),
                Forms\Components\Select::make('personals_id')
                ->label('Personal')
                ->relationship('personals','name')
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('equips_id')
                ->label('equipo')
                ->relationship('equips','name')
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('rooms_id')
                ->label('numero de habitacion')
                ->relationship('rooms','rooms_number')
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('specials_areas_id')
                ->label('Area especial')
                ->relationship('specials_areas','Area')
                ->searchable()
                ->preload(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('date_activities')
                ->label('Fecha de actividad')
                    ->dateTime()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('end_activities')
                    ->label('Fin de actividad')
                    ->dateTime()
                    ->sortable(),
                    Tables\Columns\SelectColumn::make('progress')
                    ->label('progreso')
                    ->options(activity::$activityType) 
                    ->searchable(),
                Tables\Columns\TextColumn::make('personals.name')
                ->label('Personal')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('equips.name')
                ->label('equipo')
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
                    
                    Tables\Columns\TextColumn::make('specials_areas.Area')
                    ->label('Area especial')
                        ->numeric()
                        ->sortable(),
                Tables\Columns\TextColumn::make('rooms.rooms_number')
                ->label('numero de habitacion')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('rooms.state')
                    ->label('estado de habitacion')
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
    public function getEnumOptions(): array
    {
        
        return activity::enumroomStates(); 
        
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListActivities::route('/'),
            'create' => Pages\CreateActivity::route('/create'),
            'edit' => Pages\EditActivity::route('/{record}/edit'),
        ];
    }
}
