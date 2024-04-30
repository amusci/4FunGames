using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float speed;
    public float jumpForce;
    private float move;

    public bool isJumping;
    

    private Rigidbody2D rb;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();

        
    }

    // Update is called once per frame
    void Update()
    {


        rb.velocity = new Vector2(speed, rb.velocity.y);

        if (Input.GetButtonDown("Jump") && !isJumping)
        {

            rb.AddForce(new Vector2(rb.velocity.x, jumpForce));
            Debug.Log("jump");

        }


    }


    void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Ground"))
        {

            isJumping = false;


        }
    }

        void OnCollisionExit2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Ground"))
        {

            isJumping = true;


        }
    }



}
