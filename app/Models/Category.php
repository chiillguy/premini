<?php

namespace App\Models;

use Egulias\EmailValidator\Parser\Comment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Category extends Model
{
    protected $guarded = [
        'id'
    ];

    /**
     * Get all of the comments for the Category
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function recipes(): HasMany
    {
        return $this->hasMany(Comment::class, 'category_id');
    }
}
