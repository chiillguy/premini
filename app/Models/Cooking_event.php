<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Cooking_event extends Model
{
    protected $guarded = [
        'id',
    ];

    /**
     * Get the user that owns the Cooking_event
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function chef(): BelongsTo
    {
        return $this->belongsTo(User::class, 'chef_id');
    }
}
