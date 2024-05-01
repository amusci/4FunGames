using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float speed;
    public float jumpForce;
    private float move;

    public bool isJumping;
    private int jumpCount = 0;

    

    private Rigidbody2D rb;
    private Animator animator = null;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>(); // get rigidbody component
        animator = GetComponent<Animator>(); // get animator component

        
    }

    // Update is called once per frame
    void Update()
    {


        rb.velocity = new Vector2(speed, rb.velocity.y); // set speed to right

        if (Input.GetButtonDown("Jump") && !isJumping)
        {

            rb.AddForce(new Vector2(rb.velocity.x, jumpForce));
            Debug.Log("jump");
            Debug.Log(jumpCount);
            animator.SetBool("isDead",false);
            jumpCount++;
            switch (jumpCount)
            {
                case 0:
                    animator.SetTrigger("Idle");
                    break;
                case 1:
                    animator.SetTrigger("Jump1");
                    break;
                case 2:
                    animator.SetTrigger("Jump2");
                    break;
                case 3:
                    animator.SetTrigger("Jump3");
                    break;
                case 4:
                    animator.SetTrigger("Jump4");
                    break;
            }

        }
        


    }


    void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Ground"))
        {
            
            isJumping = false; // set to false when player lans on ground
            //animator.SetBool("isJumping", false);
            if (jumpCount >= 4)
            {

                ResetJumpCount();

            }


        }
    }

    void OnCollisionExit2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Ground"))
        {

            isJumping = true;


        }
    }

    public void ResetJumpCount()
    {
        jumpCount = 0;
        animator.SetBool("isDead", true);
        animator.ResetTrigger("Jump1");
        animator.ResetTrigger("Jump2");
        animator.ResetTrigger("Jump3");
        animator.ResetTrigger("Jump4");
    }


}
