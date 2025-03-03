<?php

namespace App\Models;

use Egulias\EmailValidator\Parser\Comment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Recipe extends Model
{
    protected $guarded = [
        'id',
    ];

    protected $fillable = [
        'chef_id',
        'title',
        'description',
        'category_id',
        'image',
    ];

    /**
     * Get the user that owns the Recipe
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function chef(): BelongsTo
    {
        return $this->belongsTo(User::class, 'chef_id');
    }

    /**
     * Get the user that owns the Recipe
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    /**
     * Get all of the comments for the Recipe
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function recipe_reviews(): HasMany
    {
        return $this->hasMany(Comment::class, 'recipe_id');
    }
}
